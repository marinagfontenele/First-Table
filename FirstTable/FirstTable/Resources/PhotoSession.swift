//
//  PhotoSession.swift
//  FirstTable
//
//  Created by Camilla Carvalho Peixoto on 06/09/26.
//

import Foundation
import UIKit
import Observation

@Observable
final class PhotoSession {
    private(set) var totalQuestions: Int = 0
    private(set) var photoCheckpoints: [Int] = []
    private(set) var selectedTasks: [PhotoTask] = []
    private(set) var currentPhotoIndex: Int = 0
    private(set) var results: [PhotoResult] = []
    private(set) var hasStarted = false
    private(set) var currentQuestion: Int = 1
    
    func start(totalQuestions: Int, firstTaskName: String){
        guard !hasStarted else { return }
        
        self.totalQuestions = totalQuestions
        
        currentQuestion = 1
        currentPhotoIndex = 0
        results = []
        
        switch totalQuestions {
        case 5:
            photoCheckpoints = [0, 3, 5]
        case 10:
            photoCheckpoints = [0, 3, 6, 9, 10]
        case 15:
            photoCheckpoints = [0, 3, 6, 9, 12]
        default:
            photoCheckpoints = []
        }
        
        
        createTasks(firstTaskName: firstTaskName)
        hasStarted = true
    }
    
    func goToNextQuestion() {
        guard currentQuestion < totalQuestions else { return }
        currentQuestion += 1
    }
    
    private func createTasks(firstTaskName: String) {
        let numberOfPhotos = photoCheckpoints.count
        
        var tasks: [PhotoTask] = [
            PhotoTask.firstTask(name: firstTaskName)
        ]
        
        let numberOfRandomTasks = numberOfPhotos - 1
        
        let randomTasks = Array(
            PhotoTask.randomTasks
                .shuffled()
                .prefix(numberOfRandomTasks)
        )
        
        tasks.append(contentsOf: randomTasks)
        selectedTasks = tasks
    }
    
    private func reset() {
        totalQuestions = 0
        photoCheckpoints = []
        selectedTasks = []
        currentPhotoIndex = 0
        results = []
        hasStarted = false
    }
    
    var currentTask: PhotoTask? {
        guard currentPhotoIndex < selectedTasks.count else { return nil }
        return selectedTasks[currentPhotoIndex]
    }
    
    func saveCurrentPhoto(_ image: UIImage) {
        guard let task = currentTask else { return }
        let result = PhotoResult(task: task, image: image)
        results.append(result)
    }
    
    func goToNextPhoto() {
        guard currentPhotoIndex < selectedTasks.count - 1 else { return }
        currentPhotoIndex += 1
    }
    
    func shouldTakePhoto(afterQuestion question: Int) -> Bool {
        photoCheckpoints.contains(question)
    }
    
    var isLastPhoto: Bool {
        guard !selectedTasks.isEmpty else { return false }
        return currentPhotoIndex == selectedTasks.count - 1
    }
    
    var needsInitialPhoto: Bool {
        photoCheckpoints.first == 0 && currentPhotoIndex == 0 && results.isEmpty
    }
}
